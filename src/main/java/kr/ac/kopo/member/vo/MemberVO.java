package kr.ac.kopo.member.vo;

public class MemberVO {
	
	// 1. 멤버변수 
    private String id;
    private String password;
    private String name;
    private String birthDate;
    private String phone;
    private String email;
    private String role = "user"; 

    
    // 2. 기본 생성자
    public MemberVO() {
    	
    }

    
    // 3-1. 모든 필드 초기화 생성자: 관리자가 모든 정보를 한 번에 설정할 때
    public MemberVO(String id, String password, String name, String birthDate, String phone, String email, String role) {
        this.id = id;
        this.password = password;
        this.name = name;
        this.birthDate = birthDate;
        this.phone = phone;
        this.email = email;
        this.role = role;
    }
    
    // 3-2. 'role' 제외 생성자: 일반 회원가입 시
    public MemberVO(String id, String password, String name, String birthDate, String phone, String email) {
        this.id = id;
        this.password = password;
        this.name = name;
        this.birthDate = birthDate;
        this.phone = phone;
        this.email = email;
    }

    // 3-3. 'password', 'role' 제외 생성자: 회원 정보 조회 시
    public MemberVO(String id, String name, String birthDate, String phone, String email) {
        this.id = id;
        this.name = name;
        this.birthDate = birthDate;
        this.phone = phone;
        this.email = email;
    }

    // 3-4. 로그인된 사용자의 정보를 수정하는 생성자
    public MemberVO(String password, String name, String phone, String email) {
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.email = email;
    }


    // 4. getter, setter
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getBirthDate() {
		return birthDate;
	}


	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	// 5. toString() 오버라이드
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", birthDate=" + birthDate
				+ ", phone=" + phone + ", email=" + email + ", role=" + role + "]";
	}


    
    
    
    

}
