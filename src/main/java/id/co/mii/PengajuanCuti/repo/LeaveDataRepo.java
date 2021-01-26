package id.co.mii.PengajuanCuti.repo;

import id.co.mii.PengajuanCuti.models.*;
import id.co.mii.PengajuanCuti.models.Leavedata;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author VINTHERA
 */
@Repository
public interface LeaveDataRepo extends JpaRepository<Leavedata, String> {

    List<Leavedata> findByemployee(Employee emp);
    List<Leavedata> findBystatus(Status sts);

//    @Modifying
//    @Query("UPDATE Leavedata ld set ld.status = :sts WHERE ld.id = :ldid")
//    void updateStatus(@Param("sts") String status, @Param("ldid") String id);
}
