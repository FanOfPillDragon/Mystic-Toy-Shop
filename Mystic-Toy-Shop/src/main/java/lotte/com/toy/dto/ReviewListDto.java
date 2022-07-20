package lotte.com.toy.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

import java.sql.Timestamp;
@Getter
@AllArgsConstructor
@ToString
public class ReviewListDto {
    private String review_title;
    private String review_content;
    private String user_name;
    private int review_rate;
    private Timestamp review_register_date;
    private char is_deleted;
}
