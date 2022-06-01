package bean;

import java.math.BigDecimal;

public class repair {
    private int id;
    private String equnumber;
    private String equname;
    private String subdate;
    private String leader;
    private String repaircompany;
    private BigDecimal fee;
    private String reason;
    private String state;
    private String createtime;

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEqunumber() {
        return equnumber;
    }

    public void setEqunumber(String equnumber) {
        this.equnumber = equnumber;
    }

    public String getEquname() {
        return equname;
    }

    public void setEquname(String equname) {
        this.equname = equname;
    }

    public String getSubdate() {
        return subdate;
    }

    public void setSubdate(String subdate) {
        this.subdate = subdate;
    }

    public String getLeader() {
        return leader;
    }

    public void setLeader(String leader) {
        this.leader = leader;
    }

    public String getRepaircompany() {
        return repaircompany;
    }

    public void setRepaircompany(String repaircompany) {
        this.repaircompany = repaircompany;
    }

    public BigDecimal getFee() {
        return fee;
    }

    public void setFee(BigDecimal fee) {
        this.fee = fee;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
