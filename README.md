# Techwerkers.nl Conduit Matrix setup on microk8s

This repo has some k8s charts are work with a microk8s install on a Hetzner
cloud server.

Much is still WIP, but it "works".

## SOPS

This repo uses [SOPS](https://github.com/getsops/sops) to encrypt secrets at
rest.

You likely will not need to operate on the secrets, since it requires sharing
the private decryption key. If you need the decryption key, please contact
[me](nayben@gmail.com).

### Pre-requisites

SOPS Install: https://github.com/viaduct-ai/kustomize-sops?tab=readme-ov-file#install-the-latest-release

`age` compatible encryption.

[age](https://github.com/FiloSottile/age) [compatible](https://github.com/str4d/rage)
encryption (for generating keys if needed).

### Decrypting and apply secrets

To decrypt and apply secrets, you can use the following command:

```sh
sops decrypt <secret-file>.enc.yaml | kubectl apply -f -
```

### Lost the private key?

> [!NOTE]
> You only need to do this if you lose the private key. If the private key is
> truly lost, you will not be able to recover the existing secrets.

Using [rage](https://github.com/str4d/rage) to generate a new key:

```sh
$ rage-keygen >> $XDG_CONFIG_HOME/sops/age/keys.txt
Public key: ageSomeLongPublicKeyThatIsGeneratedHere
```

Then, add the key in `.sops.yaml` against the appropriate `age` key.

Remove the old file and re-encrypt the secrets:

```sh
rm <secrets file>.enc.yaml
sops edit <secrets file>.enc.yaml
```
