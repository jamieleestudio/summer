package com.summer.common.page;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.domain.PageRequest;

import java.io.Serializable;

/*
 * 分页参数
 * @author Likasi
 * @date 19/05/2021 00:08
 */
@Getter
@Setter
public class PageParam implements Serializable {

    private Integer page;

    private Integer size;

    public PageRequest toPageRequest(){
        return PageRequest.of(this.page-1,this.size);
    }

}
