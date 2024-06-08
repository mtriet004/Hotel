package DTO;

import java.io.Serializable;

/**
 *
 * @author ASUS
 */
public class Service implements Serializable{
    private int serviceId;
    private String serviceName;
    private String status;

    public Service(int serviceId, String serviceName, String status) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.status = status;
    }

    public Service() {
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
    
}
