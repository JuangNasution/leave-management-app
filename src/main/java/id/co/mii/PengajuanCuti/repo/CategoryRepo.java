package id.co.mii.PengajuanCuti.repo;

import id.co.mii.PengajuanCuti.models.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Juang Nasution
 */
@Repository
public interface CategoryRepo extends JpaRepository<Category, String> {
    
}

