package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.charity.entity.Donation;

import java.util.List;

public interface DonationRepository extends JpaRepository<Donation, Long> {
//    @Query("select u from User u where u.id=?1")
//    int findByIdCustom(Long id);

    static int findAllBags(List<Donation> donations) {
        int counter = 0;
        for (Donation donation : donations) {
            counter += donation.getQuantity();
        }
        return counter;
    }
}
