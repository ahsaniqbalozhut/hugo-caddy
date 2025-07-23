
---

# Supreme Dental Docs

This repository contains the official **Supreme Dental** documentation site, powered by [MkDocs](https://www.mkdocs.org/) and containerized with Docker.

---

## ✅ Requirements

- [Docker](https://docs.docker.com/get-docker/) must be installed and running

---

## ▶️ Run the Site Locally

To launch the documentation site in your browser:

```bash
bash run.sh
```

The site will be available at: [http://localhost:8000](http://localhost:8000)

---

## 📝 Updating the Documentation

1. **Edit any `.md` file** under the `docs/` directory (e.g. `docs/seo.md`, `docs/branding.md`, etc.)
2. **Ensure the file starts with** the following metadata block (YAML frontmatter):

   ```md
   ---
   title: "Your Page Title"
   date: 2025-07-19
   draft: false
   ---
   ```

3. **Commit and push your changes**:

   ```bash
   git add .
   git commit -m "Update documentation"
   git push origin main
   ```

4. **Wait for the GitHub Actions pipeline** to complete.
5. (Optional) **Run the site locally** to preview your changes:

   ```bash
   ./run.sh
   ```

---

## 🌐 Making the Website Live at `supremedental.ocooee.com`

The documentation site is made publicly accessible via [https://supremedental.ocooee.com](https://supremedental.ocooee.com) using a Cloudflare Tunnel and Docker, deployed via Ansible.

### 📦 Deployment Playbook

- **Playbook**: `/do/ansible/playbooks/ocooee-supreme.yml`
- **Reference**: Appears as **playbook #11** in the `play.sh` orchestration script
- **Target**: Deployed on a **pre-existing dev server (`mysql1`)** to avoid provisioning additional infrastructure

> 🛠️ **First-time setup:** Refer to inline comments in `ocooee-supreme.yml` for instructions specific to initial deployments, such as Docker installation and tunnel configuration.

### 🚀 To Deploy Updates

After your GitHub commit and once the CI pipeline finishes:

```bash
ansible-playbook /do/ansible/playbooks/ocooee-supreme.yml
```

> ⚠️ **Expected Downtime:** There may be a brief service interruption (~30 seconds) while the container is rebuilt and restarted.

Once the playbook completes, the latest version of the documentation will be live.

---

## 📁 Project Structure

| File/Folder                    | Description                                           |
| ------------------------------ | ----------------------------------------------------- |
| `docs/index.md`                | Homepage of the website                               |
| `docs/*.md`                    | Documentation pages (branding, SEO, engagement, etc.) |
| `mkdocs.yml`                   | MkDocs configuration file (nav, theme, settings)      |
| `requirements.txt`             | Python dependencies for MkDocs                        |
| `run.sh`                       | Script to serve the site locally using Docker         |
| `Dockerfile`                   | Docker image setup for MkDocs                         |
| `.github/workflows/docker.yml` | GitHub Actions/ CI workflow for automated builds      |

---

