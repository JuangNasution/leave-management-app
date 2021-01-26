package id.co.mii.PengajuanCuti.repo;

import id.co.mii.PengajuanCuti.models.Type;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Juang Nasution
 */
@Repository
public interface TypeRepo extends JpaRepository<Type, String> {
    Type findByname (String name);
}
