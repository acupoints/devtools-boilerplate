# Class 'Greeting' has no 'objects' memberpylint(no-member)
```python
def db(request):

    greeting = Greeting()
    greeting.save()
    ## Class 'Greeting' has no 'objects' memberpylint(no-member)
    greetings = Greeting.objects.all()

    return render(request, "db.html", {"greetings": greetings})
```

```bash
pip install pylint-django

```

```json
{
    //...
    "python.linting.pylintArgs": [
        "--load-plugins=pylint-django"
    ],
}
```
