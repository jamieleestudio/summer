package com.summer.iam.domain.service;

import com.summer.iam.domain.model.Department;
import com.summer.iam.domain.model.Position;
import com.summer.iam.domain.repository.DepartmentRepository;
import com.summer.iam.domain.repository.PositionRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class OrganizationService {
    private final DepartmentRepository departmentRepository;
    private final PositionRepository positionRepository;

    public OrganizationService(DepartmentRepository departmentRepository, PositionRepository positionRepository) {
        this.departmentRepository = departmentRepository;
        this.positionRepository = positionRepository;
    }

    public List<Department> listDepartments() {
        return departmentRepository.findAll();
    }

    public List<DepartmentNode> departmentTree() {
        List<Department> all = departmentRepository.findAll();
        Map<String, DepartmentNode> map = new HashMap<>();
        for (Department d : all) {
            DepartmentNode n = new DepartmentNode();
            n.setId(d.getId());
            n.setPid(d.getPid());
            n.setName(d.getName());
            n.setCode(d.getCode());
            n.setIcon(d.getIcon());
            n.setSort(d.getSort());
            n.setRoot(Boolean.TRUE.equals(d.getRoot()));
            map.put(d.getId(), n);
        }
        for (DepartmentNode n : map.values()) {
            String pid = n.getPid();
            if (pid != null && map.containsKey(pid)) {
                map.get(pid).getChildren().add(n);
            }
        }
        return map.values().stream()
                .filter(n -> n.isRoot() || n.getPid() == null || !map.containsKey(n.getPid()))
                .sorted((a,b) -> Integer.compare(a.getSort() == null ? 0 : a.getSort(), b.getSort() == null ? 0 : b.getSort()))
                .collect(Collectors.toList());
    }

    public Department createDepartment(Department input) {
        if (input.getPid() != null) {
            if (departmentRepository.findById(input.getPid()).isEmpty()) {
                throw new RuntimeException("上级部门不存在");
            }
        }
        return departmentRepository.save(input);
    }

    public Optional<Department> updateDepartment(String id, Department input) {
        return departmentRepository.findById(id).map(existing -> {
            if (input.getPid() != null) {
                if (departmentRepository.findById(input.getPid()).isEmpty()) {
                    throw new RuntimeException("上级部门不存在");
                }
                if (id.equals(input.getPid())) {
                    throw new RuntimeException("不能将上级设置为自身");
                }
                if (formsCycle(id, input.getPid())) {
                    throw new RuntimeException("不能形成循环父子关系");
                }
            }
            existing.setPid(input.getPid());
            existing.setName(input.getName());
            existing.setIcon(input.getIcon());
            existing.setRoot(input.getRoot());
            existing.setCode(input.getCode());
            existing.setSort(input.getSort());
            return departmentRepository.save(existing);
        });
    }

    public void deleteDepartment(String id) {
        List<Department> all = departmentRepository.findAll();
        boolean hasChildren = all.stream().anyMatch(d -> id.equals(d.getPid()));
        if (hasChildren) {
            throw new RuntimeException("请先删除子部门");
        }
        List<Position> positions = positionRepository.findAllByDepartmentId(id);
        if (!positions.isEmpty()) {
            throw new RuntimeException("请先处理部门下的岗位");
        }
        departmentRepository.deleteById(id);
    }

    public List<Position> listPositions(String departmentId) {
        if (departmentId == null) return positionRepository.findAll();
        return positionRepository.findAllByDepartmentId(departmentId);
    }

    public Position createPosition(Position input) {
        if (input.getDepartmentId() != null && departmentRepository.findById(input.getDepartmentId()).isEmpty()) {
            throw new RuntimeException("所属部门不存在");
        }
        return positionRepository.save(input);
    }

    public Optional<Position> updatePosition(String id, Position input) {
        return positionRepository.findById(id).map(existing -> {
            if (input.getDepartmentId() != null && departmentRepository.findById(input.getDepartmentId()).isEmpty()) {
                throw new RuntimeException("所属部门不存在");
            }
            existing.setName(input.getName());
            existing.setCode(input.getCode());
            existing.setDepartmentId(input.getDepartmentId());
            existing.setType(input.getType());
            existing.setDescription(input.getDescription());
            existing.setSort(input.getSort());
            return positionRepository.save(existing);
        });
    }

    private boolean formsCycle(String id, String newPid) {
        String current = newPid;
        int guard = 0;
        while (current != null && guard++ < 1000) {
            if (id.equals(current)) return true;
            Optional<Department> parent = departmentRepository.findById(current);
            current = parent.map(Department::getPid).orElse(null);
        }
        return false;
    }

    public void deletePosition(String id) {
        positionRepository.deleteById(id);
    }

    public static class DepartmentNode {
        private String id;
        private String pid;
        private String name;
        private String code;
        private String icon;
        private Integer sort;
        private boolean root;
        private List<DepartmentNode> children = new ArrayList<>();
        public String getId() { return id; }
        public void setId(String id) { this.id = id; }
        public String getPid() { return pid; }
        public void setPid(String pid) { this.pid = pid; }
        public String getName() { return name; }
        public void setName(String name) { this.name = name; }
        public String getCode() { return code; }
        public void setCode(String code) { this.code = code; }
        public String getIcon() { return icon; }
        public void setIcon(String icon) { this.icon = icon; }
        public Integer getSort() { return sort; }
        public void setSort(Integer sort) { this.sort = sort; }
        public boolean isRoot() { return root; }
        public void setRoot(boolean root) { this.root = root; }
        public List<DepartmentNode> getChildren() { return children; }
        public void setChildren(List<DepartmentNode> children) { this.children = children; }
    }
}
