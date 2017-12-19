package bath.group3.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="GROUP_TABLE")
public class Group {
	@Id
	private String id;
	private String groupName;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	@Override
	public String toString() {
		return "Group [id=" + id + ", groupName=" + groupName + "]";
	}
	public Group(String id, String groupName) {
		super();
		this.id = id;
		this.groupName = groupName;
	}
	public Group() {
		super();
	}
	
}
