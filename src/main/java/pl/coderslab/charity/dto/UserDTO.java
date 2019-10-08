package pl.coderslab.charity.dto;

import lombok.Getter;
import lombok.Setter;
import pl.coderslab.charity.entity.Role;

import java.util.List;

@Getter
@Setter
public class UserDTO {
    //    private Long userid;
    private String name;
    private String surname;
    private String email;
    private String password;
    private int active;
    private List<Role> roles;
}
