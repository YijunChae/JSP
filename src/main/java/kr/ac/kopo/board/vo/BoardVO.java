package kr.ac.kopo.board.vo;

public class BoardVO {

	// 1. 멤버변수
    private int no;
    private String title;
    private String writer;
    private String content;
    private int viewCnt;
    private String regDate;

    
    // 2. 기본 생성자
    public BoardVO() {
    	
    }

    
    // 3-1) 모든 필드 초기화 생성자: 모든 정보를 한 번에 설정할 때
    public BoardVO(int no, String title, String writer, String content, int viewCnt, String regDate) {
        this.no = no;
        this.title = title;
        this.writer = writer;
        this.content = content;
        this.viewCnt = viewCnt;
        this.regDate = regDate;
    }


    // 3-2) no, view_cnt, reg_date 제외 생성자: 글을 수정할 때
    public BoardVO(String title, String writer, String content) {
        this.title = title;
        this.writer = writer;
        this.content = content;
    }
    
    
    // 3-3) (no, title, writer, content, regDate);
    public BoardVO(int no, String title, String writer, String content, String regDate) {
    	super();
    	this.no = no;
    	this.title = title;
    	this.writer = writer;
    	this.content = content;
    	this.regDate = regDate;
    }
    

    
    // 4. getter, setter
    public int getNo() {
        return no;
    }



	public void setNo(int no) {
        this.no = no;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getViewCnt() {
        return viewCnt;
    }

    public void setViewCnt(int viewCnt) {
        this.viewCnt = viewCnt;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }


    // 5. toString() 오버라이드
	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", title=" + title + ", writer=" + writer + ", content=" + content + ", viewCnt="
				+ viewCnt + ", regDate=" + regDate + "]";
	}


    
    

    
    
	
}
