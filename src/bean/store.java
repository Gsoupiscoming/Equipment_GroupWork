package bean;

import java.math.BigDecimal;

public class store {
    private int id;
    private String equnumber;
    private String equname;
    private String producedate;
    private String indate;
    private int counts;
    private BigDecimal price;
    private String optor;
    private String equtype;

    public String getEqutype() {
        return equtype;
    }

    public void setEqutype(String equtype) {
        this.equtype = equtype;
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

    public String getProducedate() {
        return producedate;
    }

    public void setProducedate(String producedate) {
        this.producedate = producedate;
    }

    public String getIndate() {
        return indate;
    }

    public void setIndate(String indate) {
        this.indate = indate;
    }

    public int getCounts() {
        return counts;
    }

    public void setCounts(int counts) {
        this.counts = counts;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getOptor() {
        return optor;
    }

    public void setOptor(String optor) {
        this.optor = optor;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    private String createtime;
}
