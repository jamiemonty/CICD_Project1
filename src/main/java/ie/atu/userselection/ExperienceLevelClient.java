package ie.atu.userselection;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Map;

@FeignClient(name = "experience-level-service", url = "http://localhost:8081/api")
public interface ExperienceLevelClient {

    @GetMapping("/exercise/calculate-weights/{expId}")
    Map<String, Double> calculateWeights(@PathVariable Long expId);
}
