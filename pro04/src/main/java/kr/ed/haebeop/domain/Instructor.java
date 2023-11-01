package kr.ed.haebeop.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Instructor {
    private int no;
    private String id;
    private String pw;
    private String name;
    private String tel;
    private String email;
}
