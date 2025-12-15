locals {

    private_subnets = {
        for k, v in data.aws_subnet.subnet : k => v
            if can(regex(".*private.*", lower(v.tags.Name)))
    }

    private_subnet_ids = [for s in local.private_subnets : s.id]
}