import hashlib

from src.keypair import Keypair
from src.payload import CodePayload

def generate_rendezvous_keypair(payload: CodePayload) -> Keypair:
    return Keypair.from_seed(hashlib.sha256(payload.to_binary()).digest())
