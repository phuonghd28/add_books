package com.movie.cinema.cenima.entity;

public class Cinema {

    private String id;
    private String name;
    private String address;
    private int status;
    private Long createDate;
    private Long updateDate;
    private Long deleteDate;



    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Long getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Long createDate) {
        this.createDate = createDate;
    }

    public Long getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Long updateDate) {
        this.updateDate = updateDate;
    }

    public Long getDeleteDate() {
        return deleteDate;
    }

    public void setDeleteDate(Long deleteDate) {
        this.deleteDate = deleteDate;
    }

    public static final class CinemaBuilder {
        private String id;
        private String name;
        private String address;
        private int status;
        private Long createDate;
        private Long updateDate;
        private Long deleteDate;

        private CinemaBuilder() {
        }

        public static CinemaBuilder aCinema() {
            return new CinemaBuilder();
        }

        public CinemaBuilder withId(String id) {
            this.id = id;
            return this;
        }

        public CinemaBuilder withName(String name) {
            this.name = name;
            return this;
        }

        public CinemaBuilder withAddress(String address) {
            this.address = address;
            return this;
        }

        public CinemaBuilder withStatus(int status) {
            this.status = status;
            return this;
        }

        public CinemaBuilder withCreateDate(Long createDate) {
            this.createDate = createDate;
            return this;
        }

        public CinemaBuilder withUpdateDate(Long updateDate) {
            this.updateDate = updateDate;
            return this;
        }

        public CinemaBuilder withDeleteDate(Long deleteDate) {
            this.deleteDate = deleteDate;
            return this;
        }

        public Cinema build() {
            Cinema cinema = new Cinema();
            cinema.setId(id);
            cinema.setName(name);
            cinema.setAddress(address);
            cinema.setStatus(status);
            cinema.setCreateDate(createDate);
            cinema.setUpdateDate(updateDate);
            cinema.setDeleteDate(deleteDate);
            return cinema;
        }
    }
}
