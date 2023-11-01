package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class LecFile {
    private int no; // 번호
    private String sfile; // 난수화된 파일 이름
    private String realName; // 실제 파일 이름
}
