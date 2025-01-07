package ie.atu.userselection;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

public class ExperienceLevel {

    private Long id;
    private Double multiplier;

    public ExperienceLevel() {}

    public ExperienceLevel(Double multiplier) {
        this.multiplier = multiplier;
    }

    public Double getMultiplier() {return multiplier;}

    public void setMultiplier(Double multiplier) {
        this.multiplier = multiplier;
    }
}
