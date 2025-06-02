from . import server
import asyncio

def main(use_tcp=False, host='0.0.0.0', port=3500):
    """Main entry point for the package."""
    asyncio.run(server.main(use_tcp=use_tcp, host=host, port=port))

# Optionally expose other important items at package level
__all__ = ['main', 'server']