package id.co.mii.PengajuanCuti.repo;

import id.co.mii.PengajuanCuti.models.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
/**
 *
 * @author VINTHERA
 */
@Repository
public interface EmployeeRepo extends JpaRepository<Employee, String>{
    Employee findByemail(String email);
}
