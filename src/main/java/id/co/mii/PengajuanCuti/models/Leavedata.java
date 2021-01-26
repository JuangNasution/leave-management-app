package id.co.mii.PengajuanCuti.models;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Juang Nasution
 */
@Entity
@Table(name = "leavedata")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Leavedata.findAll", query = "SELECT l FROM Leavedata l")
    , @NamedQuery(name = "Leavedata.findById", query = "SELECT l FROM Leavedata l WHERE l.id = :id")
    , @NamedQuery(name = "Leavedata.findByStartDate", query = "SELECT l FROM Leavedata l WHERE l.startDate = :startDate")
    , @NamedQuery(name = "Leavedata.findByEndDate", query = "SELECT l FROM Leavedata l WHERE l.endDate = :endDate")
    , @NamedQuery(name = "Leavedata.findByNote", query = "SELECT l FROM Leavedata l WHERE l.note = :note")
    , @NamedQuery(name = "Leavedata.findByManagerNote", query = "SELECT l FROM Leavedata l WHERE l.managerNote = :managerNote")})
public class Leavedata implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "id")
    private String id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "start_date")
    @Temporal(TemporalType.DATE)
    private Date startDate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "end_date")
    @Temporal(TemporalType.DATE)
    private Date endDate;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "note")
    private String note;
    @Size(max = 300)
    @Column(name = "manager_note")
    private String managerNote;
    @JoinColumn(name = "status", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Status status;
    @JoinColumn(name = "employee", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Employee employee;
    @JoinColumn(name = "manager", referencedColumnName = "manager")
    @ManyToOne(fetch = FetchType.LAZY)
    private Employee manager;
    @JoinColumn(name = "type", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Type type;

    public Leavedata() {
    }

    public Leavedata(String id) {
        this.id = id;
    }

    public Leavedata(String id, Date startDate, Date endDate, String note) {
        this.id = id;
        this.startDate = startDate;
        this.endDate = endDate;
        this.note = note;
    }

    public Leavedata(String id, Date startDate, Date endDate, String note, String managerNote, Status status, Employee employee, Employee manager, Type type) {
        this.id = id;
        this.startDate = startDate;
        this.endDate = endDate;
        this.note = note;
        this.managerNote = managerNote;
        this.status = status;
        this.employee = employee;
        this.manager = manager;
        this.type = type;
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getManagerNote() {
        return managerNote;
    }

    public void setManagerNote(String managerNote) {
        this.managerNote = managerNote;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Employee getManager() {
        return manager;
    }

    public void setManager(Employee manager) {
        this.manager = manager;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Leavedata)) {
            return false;
        }
        Leavedata other = (Leavedata) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "id.co.mii.PengajuanCuti.models.Leavedata[ id=" + id + " ]";
    }
    
}
