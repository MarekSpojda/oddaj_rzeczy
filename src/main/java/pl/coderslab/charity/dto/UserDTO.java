package pl.coderslab.charity.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserDTO {
    //    private Long userid;
    private String name;
    private String surname;
    private String email;
    private String password;
    private String password2;
}
