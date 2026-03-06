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