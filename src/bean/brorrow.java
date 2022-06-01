package bean;



public class brorrow {
    private int id;
    private int dataid;
    private int sysuerid;
    private String brorrowdate;
    private int ckuserid;
    private String state;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDataid() {
        return dataid;
    }

    public void setDataid(int dataid) {
        this.dataid = dataid;
    }

    public int getSysuerid() {
        return sysuerid;
    }

    public void setSysuerid(int sysuerid) {
        this.sysuerid = sysuerid;
    }

    public String getBrorrowdate() {
        return brorrowdate;
    }

    public void setBrorrowdate(String brorrowdate) {
        this.brorrowdate = brorrowdate;
    }

    public int getCkuserid() {
        return ckuserid;
    }

    public void setCkuserid(int ckuserid) {
        this.ckuserid = ckuserid;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    private String createtime;
}
