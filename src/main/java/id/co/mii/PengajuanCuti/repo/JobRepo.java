package id.co.mii.PengajuanCuti.repo;

import id.co.mii.PengajuanCuti.models.*;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Juang Nasution
 */
@Repository
public interface JobRepo extends JpaRepository<Job, String>{
//    List<Job> findBystatus(Boolean isActive);
}
