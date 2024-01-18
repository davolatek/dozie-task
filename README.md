# Node.js Microservice Deployment with Monitoring

This repository contains an Ansible playbook for deploying a Node.js microservice with MongoDB, Prometheus, and Grafana. The deployment is designed to work on both RPM and Debian-based servers.

## Prerequisites

Ensure you have the following prerequisites before starting the deployment:

- Ansible installed on machine.
- Target servers accessible via SSH.

## Ansible Playbook Overview

The Ansible playbook includes tasks for installing and configuring the following components:

- Node.js and npm
- MongoDB
- Prometheus
- Grafana

## Usage

1. **Clone the Node.js Application Repository:**

  Run from the JenkinsFile as provided i Jenkins/Jenkinsfile

2. **Create an Ansible Inventory File (`inventory.ini`):**

    ```ini
    [nodes]
    your_instance_ip ansible_user=your_admin_user
    ```

    Replace `your_instance_ip` and `your_admin_user` with your actual server IP and admin username.

3. **Create a `prometheus.yml` Configuration File:**

    ```yaml
    global:
      scrape_interval: 15s

    scrape_configs:
      - job_name: 'nodejs'
        static_configs:
          - targets: ['your_instance_ip:3000']

    ```

    NB: This has been provided in the base directory but instance ip should be updated to that of the node js application server

4. **Run the Ansible Playbook:**

    ```bash
    ansible-playbook -i inventory.ini deploy.yml
    ```

5. **Access Your Node.js Application:**

    Open `http://your_instance_ip:3000` in your browser.

6. **Access Grafana:**

    Open `http://your_instance_ip:3000` (default credentials: admin/admin). Configure Prometheus as a data source.

7. **Explore Your Node.js Application Metrics in Grafana.**

## Additional Notes

- **Secure Your Deployment:**
  - Change default passwords for MongoDB, Grafana, and any other services.
  - Configure firewalls to restrict access.

- **Customize the Ansible Playbook:**
  - Modify paths, user names, and other details based on your environment.
  - Adjust security settings and credentials.

- **Monitor Your Application Metrics:**
  - Prometheus metrics are exposed at `http://your_instance_ip:9090/metrics`.
  - Grafana provides a rich dashboard for visualizing metrics.

- **Troubleshooting:**
  - Check logs for each service (`/var/log/` or as specified in service configurations).
  - Ensure correct permissions and ownership for deployed files and directories.

## Conclusion

