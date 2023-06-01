/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cor_learn.entities;

/**
 *
 * @author yashsaravane
 */
public class courses {
    private String course_name;
    private int course_id;
    private String video_data;
    private int admin_id;
    private String subject;
    private int count;

    public courses(String course_name, int course_id, String video_data, int admin_id, String subject) {
        this.course_name = course_name;
        this.course_id = course_id;
        this.video_data = video_data;
        this.admin_id = admin_id;
        this.subject = subject;
    }

    public courses() {
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String getVideo_data() {
        return video_data;
    }

    public void setVideo_data(String video_data) {
        this.video_data = video_data;
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public courses(int count, String subject) {
        this.count=count;
        this.subject = subject;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
    
    
}
