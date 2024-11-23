# kube-setup

Assuming you have:

- `cluster.crt` - the cluster CA certificate
- `admin-client.crt` - the admin client certificate
- `admin-client.key` - the admin client key

Then you can setup the `kubectl` with:

```sh
./setup-kubectl.sh [user]
```

Where `[user]` defaults to `admin`.
