package kr.co.nimo.member.paging;

import org.springframework.web.util.UriComponentsBuilder;

public class Criteria {
	private int page;			// 현재 페이지 번호
    private int perPageNum;		// 한 페이지 당 보여줄 게시글 갯수
    
    private String searchType;
	private String keyword;
    
    public int getPageStart() {	// 특정 페이지의 게시글 시작 번호, 게시글 시작 행 번호
        return (this.page-1)*perPageNum;
    }
    
    public Criteria() {
        this.page = 1;
        this.perPageNum = 10;
    }
    
    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        if(page <= 0) {
            this.page = 1;
        } else {
            this.page = page;
        }
    }
    public int getPerPageNum() {
        return perPageNum;
    }
    public void setPerPageNum(int pageCount) {
        int cnt = this.perPageNum;
        if(pageCount != cnt) {
            this.perPageNum = cnt;
        } else {
            this.perPageNum = pageCount;
        }
    }

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
    
	//searchType, keyword 추가
	public String makeQuery() {
		UriComponentsBuilder url = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", this.perPageNum);
					
		if (searchType!=null) {
				url
					.queryParam("searchType", this.searchType)
					.queryParam("keyword", this.keyword);
		}
		return url.build().encode().toString();
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", searchType=" + searchType + ", keyword="
				+ keyword + "]";
	}

}

