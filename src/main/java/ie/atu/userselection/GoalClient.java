package ie.atu.userselection;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import ie.atu.userselection.GymGoal;
import java.util.List;


@FeignClient(name = "goal-service", url = "http://localhost:8082/api/gym-goal")
public interface GoalClient {
    @GetMapping("/{id}")
    GymGoal getGymGoalById(@PathVariable("id") Long id);
}
