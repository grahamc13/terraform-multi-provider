Terraform is a powerful tool used for **Infrastructure as Code** (IaC). Instead of clicking through a cloud console to set up servers or databases, you write configuration files that describe what you want your infrastructure to look like. 🏗️

Terraform then talks to cloud providers (like AWS, Azure, or Google Cloud) to make that vision a reality. It’s like having a blueprint for a building that can automatically build itself. 🤖

To help us dive into this, which of these areas would you like to explore first?

1. **The Core Workflow**: Understanding the "Write, Plan, Apply" cycle that developers use every day. 🔄
2. **State Management**: Learning how Terraform remembers what it has already built so it doesn't create duplicates. 📂
3. **Providers and Resources**: Exploring how Terraform connects to different services and what the actual code looks like. 🛠️

Stage,Command,Purpose
Write,editor,You define your infrastructure (like a VPC or an S3 bucket) in configuration files using HCL (HashiCorp Configuration Language).
Plan,terraform plan,"Terraform compares your code to what's actually running and creates an execution plan. It tells you exactly what it will create, change, or destroy."
Apply,terraform apply,"After you review the plan, you give the green light. Terraform then makes the necessary API calls to the cloud provider to reach the desired state."

Great choice. The Terraform workflow is often described as the **"Write, Plan, Apply"** cycle. It’s a predictable process that helps teams avoid accidental changes to their live infrastructure.

Here is how those three main stages work:

| Stage | Command | Purpose |
| --- | --- | --- |
| **Write** | `editor` | You define your infrastructure (like a VPC or an S3 bucket) in configuration files using HCL (HashiCorp Configuration Language). |
| **Plan** | `terraform plan` | Terraform compares your code to what's actually running and creates an execution plan. It tells you exactly what it will create, change, or destroy. |
| **Apply** | `terraform apply` | After you review the plan, you give the green light. Terraform then makes the necessary API calls to the cloud provider to reach the desired state. |

---

### Why the "Plan" step matters

Imagine you have a production database running, and you accidentally change its name in your code. In many cloud environments, renaming a database actually requires **deleting** the old one and creating a new one—which means losing your data!

The `terraform plan` command is your safety net. It would show a "destroy" action (usually in red text) for that database, giving you a chance to catch the mistake before any damage is done. 🛡️

To see how this works in practice, let's imagine we are writing code to create a simple **Storage Bucket** in the cloud.

If you were looking at a "Plan" output and saw a **+** symbol next to a resource, what do you think Terraform is intending to do with that resource?

* **A)** Delete it
* **B)** Create it
* **C)** Ignore it


Spot on! The **+** symbol is Terraform's way of signaling that it will **create** a brand-new resource to match your code. 🏗️

When you run `terraform plan`, the output uses specific symbols to show you exactly what will happen before any changes are actually made:

| Symbol | Action | Meaning |
| --- | --- | --- |
| **+** | **Create** | A new resource will be added. |
| **-** | **Destroy** | An existing resource will be removed. |
| **~** | **Update in-place** | A specific setting will change without replacing the whole resource. |
| **-/+** | **Replace** | The resource must be destroyed and recreated (usually due to a major setting change). |

---

### Putting it into practice

Now that you know the symbols, let’s look at a snippet of HCL (HashiCorp Configuration Language). This is what you would **Write** in the first stage of the workflow:

```hcl
resource "aws_s3_bucket" "my_data" {
  bucket = "my-unique-terraform-bucket-2026"
}

```

If you had **already** run `terraform apply` last week to create this bucket, but today you changed the name in your code to `"marketing-files-2026"`, Terraform would realize the names don't match.

Based on the table above, which symbol do you think you would see in the `terraform plan` output for that name change?

* **A)** `~` (Update in-place)
* **B)** `-/+` (Replace)