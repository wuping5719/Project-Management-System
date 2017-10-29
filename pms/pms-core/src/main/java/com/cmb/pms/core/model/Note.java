package com.cmb.pms.core.model;

import java.util.Date;

public class Note {
    private Integer noteID;    // 主键

    private String noteTitle;   // 主题

    private String noteContent;   // 内容

    private String noteAttachment;  // 附件

    private String noteKeyWord;  // 关键字(多个以逗号,分隔)

    private Integer notePublisherID;  // 发布人ID

    private Date notePublishDate;  // 发布日期

    private Date noteModifyDate;  // 最后修改日期

    public Integer getNoteID() {
        return noteID;
    }

    public void setNoteID(Integer noteID) {
        this.noteID = noteID;
    }

    public String getNoteTitle() {
        return noteTitle;
    }

    public void setNoteTitle(String noteTitle) {
        this.noteTitle = noteTitle == null ? null : noteTitle.trim();
    }

    public String getNoteContent() {
        return noteContent;
    }

    public void setNoteContent(String noteContent) {
        this.noteContent = noteContent == null ? null : noteContent.trim();
    }

    public String getNoteAttachment() {
        return noteAttachment;
    }

    public void setNoteAttachment(String noteAttachment) {
        this.noteAttachment = noteAttachment == null ? null : noteAttachment.trim();
    }

    public String getNoteKeyWord() {
        return noteKeyWord;
    }

    public void setNoteKeyWord(String noteKeyWord) {
        this.noteKeyWord = noteKeyWord == null ? null : noteKeyWord.trim();
    }

    public Integer getNotePublisherID() {
        return notePublisherID;
    }

    public void setNotePublisherID(Integer notePublisherID) {
        this.notePublisherID = notePublisherID;
    }

    public Date getNotePublishDate() {
        return notePublishDate;
    }

    public void setNotePublishDate(Date notePublishDate) {
        this.notePublishDate = notePublishDate;
    }

    public Date getNoteModifyDate() {
        return noteModifyDate;
    }

    public void setNoteModifyDate(Date noteModifyDate) {
        this.noteModifyDate = noteModifyDate;
    }
}