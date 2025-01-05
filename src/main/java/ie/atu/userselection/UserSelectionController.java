package ie.atu.userselection;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@CrossOrigin(origins = "http://localhost:3000")
@RestController
@RequestMapping("/api/user-selection")
public class UserSelectionController {

    private final UserSelectionRepository userSelectionRepository;
    private final GoalClient goalClient;

    public UserSelectionController(UserSelectionRepository userSelectionRepository, GoalClient goalClient) {
        this.userSelectionRepository = userSelectionRepository;
        this.goalClient = goalClient;
    }

    // Get all user selections
    @GetMapping
    public List<UserSelection> getAllUserSelections() {
        return userSelectionRepository.findAll();
    }

    // Get a specific user selection by ID
    @GetMapping("/{id}")
    public ResponseEntity<UserSelection> getUserSelectionById(@PathVariable Long id) {
        Optional<UserSelection> userSelection = userSelectionRepository.findById(id);
        return userSelection.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    // Create a new user selection
    @PostMapping
    public ResponseEntity<Map<String, Object>> createUserSelection(@RequestBody UserSelection userSelection) {
        // Save the user selection to the database
        UserSelection savedSelection = userSelectionRepository.save(userSelection);

        // Fetch GymGoal data from the external service using Feign client
        GymGoal gymGoal = goalClient.getGymGoalById(userSelection.getGoalId());

        // Prepare the response with sets and reps
        Map<String, Object> response = new HashMap<>();
        response.put("userSelectionId", savedSelection.getSelectId());
        response.put("sets", gymGoal.getSets());
        response.put("reps", gymGoal.getReps());

        return ResponseEntity.ok(response);
    }

    // Update an existing user selection
    @PutMapping("/{id}")
    public ResponseEntity<UserSelection> updateUserSelection(@PathVariable Long id, @RequestBody UserSelection updatedSelection) {
        Optional<UserSelection> existingSelection = userSelectionRepository.findById(id);
        if (existingSelection.isPresent()) {
            UserSelection selection = existingSelection.get();
            selection.setWeightId(updatedSelection.getWeightId());
            selection.setExpId(updatedSelection.getExpId());
            selection.setGoalId(updatedSelection.getGoalId());
            return ResponseEntity.ok(userSelectionRepository.save(selection));
        }
        return ResponseEntity.notFound().build();
    }

    // Delete a user selection
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUserSelection(@PathVariable Long id) {
        if (userSelectionRepository.existsById(id)) {
            userSelectionRepository.deleteById(id);
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.notFound().build();
    }
}
