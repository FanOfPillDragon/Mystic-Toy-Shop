package lotte.com.toy.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

import java.sql.Timestamp;

@Getter
@AllArgsConstructor
@ToString
public class QnaListDto {
    private String qna_title;
    private String qna_content;
    private String qna_writer;
    private String product_name;
    private Timestamp time;

}
