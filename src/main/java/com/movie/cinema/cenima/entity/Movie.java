package com.movie.cinema.cenima.entity;

public class Movie {

    private String id;
    private String name;
    private int duration;
    private String description;
    private String image;
    private String detail;
    private int status;
    private Long comingSoon;
    private Long createDate;
    private Long updateDate;
    private Long deleteDate;

    @Override
    public String toString() {
        return "Movie{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", duration=" + duration +
                ", description='" + description + '\'' +
                ", image='" + image + '\'' +
                ", detail='" + detail + '\'' +
                ", status=" + status +
                ", comingSoon=" + comingSoon +
                ", createDate=" + createDate +
                ", updateDate=" + updateDate +
                ", deleteDate=" + deleteDate +
                '}';
    }

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

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Long getComingSoon() {
        return comingSoon;
    }

    public void setComingSoon(Long comingSoon) {
        this.comingSoon = comingSoon;
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

    public static final class MovieBuilder {
        private String id;
        private String name;
        private int duration;
        private String description;
        private String image;
        private String detail;
        private int status;
        private Long comingSoon;
        private Long createDate;
        private Long updateDate;
        private Long deleteDate;

        private MovieBuilder() {
        }

        public static MovieBuilder aMovie() {
            return new MovieBuilder();
        }

        public MovieBuilder withId(String id) {
            this.id = id;
            return this;
        }

        public MovieBuilder withName(String name) {
            this.name = name;
            return this;
        }

        public MovieBuilder withDuration(int duration) {
            this.duration = duration;
            return this;
        }

        public MovieBuilder withDescription(String description) {
            this.description = description;
            return this;
        }

        public MovieBuilder withImage(String image) {
            this.image = image;
            return this;
        }

        public MovieBuilder withDetail(String detail) {
            this.detail = detail;
            return this;
        }

        public MovieBuilder withStatus(int status) {
            this.status = status;
            return this;
        }

        public MovieBuilder withComingSoon(Long comingSoon) {
            this.comingSoon = comingSoon;
            return this;
        }

        public MovieBuilder withCreateDate(Long createDate) {
            this.createDate = createDate;
            return this;
        }

        public MovieBuilder withUpdateDate(Long updateDate) {
            this.updateDate = updateDate;
            return this;
        }

        public MovieBuilder withDeleteDate(Long deleteDate) {
            this.deleteDate = deleteDate;
            return this;
        }

        public Movie build() {
            Movie movie = new Movie();
            movie.setId(id);
            movie.setName(name);
            movie.setDuration(duration);
            movie.setDescription(description);
            movie.setImage(image);
            movie.setDetail(detail);
            movie.setStatus(status);
            movie.setComingSoon(comingSoon);
            movie.setCreateDate(createDate);
            movie.setUpdateDate(updateDate);
            movie.setDeleteDate(deleteDate);
            return movie;
        }
    }
}
