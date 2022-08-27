package com.movie.cinema.cenima.enums;

public enum Status {

    ACTIVE(1, "ACTIVE"),
    LOCK(0, "LOCK"),
    DELETE(-1, "DELETE");

    private int value;
    private String name;

    Status(int value, String name) {
        this.value = value;
        this.name = name;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
