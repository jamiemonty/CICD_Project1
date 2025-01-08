package ie.atu.userselection;


import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "user_selections")
@AllArgsConstructor
@NoArgsConstructor
public class UserSelection {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long selectId;

    private Long weightId;
    private Long expId;
    private Long goalId;

    public Long getSelectId() {
        return selectId;
    }

    public Long getWeightId() {
        return weightId;
    }

    public void setWeightId(Long weightId) {
        this.weightId = weightId;
    }

    public Long getExpId() {
        return expId;
    }

    public void setExpId(Long expId) {
        this.expId = expId;
    }

    public Long getGoalId() {
        return goalId;
    }

    public void setGoalId(Long goalId) {
        this.goalId = goalId;
    }
}
