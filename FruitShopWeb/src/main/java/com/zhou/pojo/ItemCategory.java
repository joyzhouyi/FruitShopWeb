package com.zhou.pojo;
/*类目
* */
public class ItemCategory {
    /*主键
    * */
    private Integer id;
    /*
    * 类目名称
    */
    private String name;
    /*
    * 父id
    * */
    private Integer pid;
    /*
    * 是否已经删除
    * */
    private Integer isDelete;

    public ItemCategory() {
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Integer getPid() {
        return pid;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public ItemCategory(Integer id, String name, Integer pid, Integer isDelete) {
        this.id = id;
        this.name = name;
        this.pid = pid;
        this.isDelete = isDelete;
    }

    @Override
    public String toString() {
        return "ItemCategory{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", pid=" + pid +
                ", isDelete=" + isDelete +
                '}';
    }
}
