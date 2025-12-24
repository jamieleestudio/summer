package com.summer.iam.application.service.impl;

import com.summer.iam.application.command.DepartmentCreateCommand;
import com.summer.iam.application.command.DepartmentUpdateCommand;
import com.summer.iam.application.service.DepartmentService;
import com.summer.iam.domain.model.Department;
import com.summer.iam.domain.repository.DepartmentRepository;
import com.summer.iam.interfaces.rest.dto.department.DepartmentResponse;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;
import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {
    private final DepartmentRepository departmentRepository;

    public DepartmentServiceImpl(DepartmentRepository departmentRepository) {
        this.departmentRepository = departmentRepository;
    }

    @Override
    @Transactional
    public DepartmentResponse create(DepartmentCreateCommand cmd) {
        Department d = new Department();
        d.setPid(cmd.getPid());
        d.setName(cmd.getName());
        d.setIcon(cmd.getIcon());
        d.setRoot(cmd.getRoot());
        d.setCode(cmd.getCode());
        d.setSort(cmd.getSort());
        Department saved = departmentRepository.save(d);
        return DepartmentResponse.from(saved);
    }

    @Override
    @Transactional
    public Optional<DepartmentResponse> update(String id, DepartmentUpdateCommand cmd) {
        return departmentRepository.findById(id).map(d -> {
            d.setPid(cmd.getPid());
            d.setName(cmd.getName());
            d.setIcon(cmd.getIcon());
            d.setRoot(cmd.getRoot());
            d.setCode(cmd.getCode());
            d.setSort(cmd.getSort());
            Department saved = departmentRepository.save(d);
            return DepartmentResponse.from(saved);
        });
    }

    @Override
    @Transactional
    public void delete(String id) { departmentRepository.deleteById(id); }

    @Override
    @Transactional(readOnly = true)
    public List<DepartmentResponse> findAll() { return departmentRepository.findAll().stream().map(DepartmentResponse::from).toList(); }

    @Override
    @Transactional(readOnly = true)
    public Optional<DepartmentResponse> findById(String id) { return departmentRepository.findById(id).map(DepartmentResponse::from); }

}
