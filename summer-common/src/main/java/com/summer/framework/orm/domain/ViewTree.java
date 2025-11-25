package com.summer.framework.orm.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

/*
 * 抽象树
 * @author Likasi
 */
@Getter
@Setter
public class ViewTree implements GeneralTreeable<Long> {

    private Long id;

    private Long pid;

    private Integer type;

    private boolean disabled;

    private String name;

    private String label;

    private String icon;

    private Boolean isRoot;

    private List<ViewTree> children;
}
