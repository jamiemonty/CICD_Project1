package ie.atu.userselection;

import org.apache.catalina.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserSelectionRepository extends JpaRepository<UserSelection, Long> {
}
