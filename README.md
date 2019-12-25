# terraform_vm_from_image

This example will create an ubuntu machine from the managed image, created previous stage, where it can be referred from  **https://github.com/bedro96/managedimage2**.

Followings are some distinct implementation of the code. 
1. The managed image is referred from data block.
```bash
data "azurerm_resource_group" "managed_image_rg" {
  name = "${var.managed_image_resourcegroup_name}"
}
 
data "azurerm_image" "managed_image" {
  depends_on          = [data.azurerm_resource_group.managed_image_rg] 
  name                = "${var.managed_image_name}"
  resource_group_name = "${data.azurerm_resource_group.managed_image_rg.name}"
}
```

The managed image referred by following code.
```bash
resource "azurerm_virtual_machine" "ubuntu1604" {
    name                  = local.base_computer_name
    ....
    storage_os_disk {
        name              = "${local.base_computer_name}-osdisk"
        caching           = "ReadOnly"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_data_disk {
        name              = "${local.base_computer_name}-datadisk1"
        lun               = 0
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
        disk_size_gb      = 250
    }

    storage_image_reference {
        id = "${data.azurerm_image.managed_image.id}"
    }
}
```
2. Post provisioning.
There are several ways to execute a script after the provisioning is done. 
This is to demonstrate one of the way to execute a script once the vm is up-and-running.

```bash
resource "null_resource" "example_provisioner" { }
```