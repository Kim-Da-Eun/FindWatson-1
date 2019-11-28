package findwatson.review.dto;

import java.sql.Timestamp;

public class ReviewDTO {
	private int seq;
	private int articleSeq;
	private int score;
	private String title;
	private String content;
	private String header;
	private String writer;
	private Timestamp writeDate;
	private String ipAddr;
	private int likeCount;
	private int viewCount;
	
	public ReviewDTO() {
		super();
	}

	public ReviewDTO(int seq, int articleSeq, int score, String title, String content, String header, String writer,
			Timestamp writeDate, String ipAddr, int likeCount, int viewCount) {
		super();
		this.seq = seq;
		this.articleSeq = articleSeq;
		this.score = score;
		this.title = title;
		this.content = content;
		this.header = header;
		this.writer = writer;
		this.writeDate = writeDate;
		this.ipAddr = ipAddr;
		this.likeCount = likeCount;
		this.viewCount = viewCount;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getArticleSeq() {
		return articleSeq;
	}

	public void setArticleSeq(int articleSeq) {
		this.articleSeq = articleSeq;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getHeader() {
		return header;
	}

	public void setHeader(String header) {
		this.header = header;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Timestamp getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}

	public String getIpAddr() {
		return ipAddr;
	}

	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	
	
}
