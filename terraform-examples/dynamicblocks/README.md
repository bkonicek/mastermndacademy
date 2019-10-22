Basic example of dynamic blocks in terraform.

You can add as many `ingress` blocks to the variable definition as you'd like and it will create them all based off of the `dynamic` declaration in main.tf.

In this example it will create 2 rules in the new Network ACL defined in the template.