package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.entity.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
    @Query("select c from Category c where c.id=?1")
    Category findByIdCustom(Long id);
}
