package service;

import java.sql.SQLException;
import java.util.List;

import dao.NoticeDao;
import domain.Notice;

public class NoticeService {
	
	private NoticeDao dao = new NoticeDao();
    public List<Notice> getAllNotices() {
        try {
            return dao.getAllNotices();
        } catch (SQLException e) {
            throw new RuntimeException("FAILED: Query all notices!");
        }
    }
    //
    public void addNotice(Notice notice) {
        try {
            dao.addNotice(notice);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("FAILED: Add a new notice!");
        }
    }
    //
    public Notice findNoticeById(String n_id) {
        try {
            return dao.findNoticeById(n_id);
        } catch (SQLException e) {
            throw new RuntimeException("FAILED: Find notice by id!");
        }
    }
    public void updateNotice(Notice bean) {
        try {
            dao.updateNotice(bean);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    //
    public void deleteNotice(String n_id) {
        try {
            dao.deleteNotice(n_id);
        } catch (SQLException e) {
            throw new RuntimeException("FAILED: Delete the notice!");
        }
    }
    public Notice getRecentNotice() {
        try {
            return dao.getRecentNotice();
        } catch (SQLException e) {
            throw new RuntimeException("FAILED: Find the latest notice!");
        }
    }

}
