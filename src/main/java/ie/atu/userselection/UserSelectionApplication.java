package ie.atu.userselection;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@EnableFeignClients
@SpringBootApplication
public class UserSelectionApplication {

    public static void main(String[] args) {
        SpringApplication.run(UserSelectionApplication.class, args);
    }

}
