package com.summer.iam.domain.model;

public class Scope {
    public enum Type { GLOBAL, LIMITED }
    private Type type;

    public Scope(Type type) { this.type = type; }
    public Type getType() { return type; }
    public void setType(Type type) { this.type = type; }
}
