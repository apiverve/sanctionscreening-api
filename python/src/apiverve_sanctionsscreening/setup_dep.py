from setuptools import setup, find_packages

setup(
    name='apiverve_sanctionsscreening',
    version='1.2.2',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Sanctions Screening checks a person or company name against the US Treasury OFAC Specially Designated Nationals (SDN) list. It returns scored matches with aliases, dates of birth, addresses and sanctions programs so you can decide whether to block or review.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/sanctionscreening?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
