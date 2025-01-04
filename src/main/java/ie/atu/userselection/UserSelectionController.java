package ie.atu.userselection;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/user-selection")
public class UserSelectionController {

    private final UserSelectionRepository userSelectionRepository;

    public UserSelectionController(UserSelectionRepository userSelectionRepository) {
        this.userSelectionRepository = userSelectionRepository;
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
    public UserSelection createUserSelection(@RequestBody UserSelection userSelection) {
        return userSelectionRepository.save(userSelection);
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
