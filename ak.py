import discord
import asyncio
import os

# Replace with your actual bot token
BOT_TOKEN = ''

# Replace with your admin user IDs (these are the Discord user IDs)
ADMINS = [818226562045837313, 764413811201146890, 503932400066232331]  # Replace with actual admin IDs

intents = discord.Intents.default()
intents.messages = True
intents.guilds = True

client = discord.Client(intents=intents)

# Define the command prefix
COMMAND_PREFIX = '!'

@client.event
async def on_ready():
    print(f'Bot is logged in as {client.user}')

async def run_shell_command(command):
    """Run a shell command asynchronously"""
    process = await asyncio.create_subprocess_exec(
        *command,
        stdout=asyncio.subprocess.PIPE,
        stderr=asyncio.subprocess.PIPE
    )
    stdout, stderr = await process.communicate()

    if process.returncode == 0:
        return stdout.decode()
    else:
        return stderr.decode()

@client.event
async def on_message(message):
    if message.author == client.user:
        return  # Ignore messages from the bot itself
    
    # Check if the message starts with the command prefix and is from an admin
    if message.content.startswith(f'{COMMAND_PREFIX}bomb'):
        if message.author.id not in ADMINS:
            await message.channel.send("You are not authorized to use this command.")
            return

        # Extract the phone number from the command
        try:
            phone_number = message.content.split(' ')[1]
        except IndexError:
            await message.channel.send("Please provide a phone number. Usage: !bomb <number>")
            return

        await message.channel.send(f"Bombing on number: {phone_number}")

        # Run the first script (api.sh)
        try:
            await run_shell_command(['cp', 'api.sh', 'app.sh'])
            await run_shell_command(['sed', '-i', f's/€tor/{phone_number}/g', 'app.sh'])
            result = await run_shell_command(['bash', 'app.sh'])
            os.remove('app.sh')
            await message.channel.send(f"api.sh executed successfully on {phone_number}\n{result}")
        except Exception as e:
            await message.channel.send(f"Error executing api.sh: {str(e)}")

        # Run the second script (api1.sh)
        try:
            await run_shell_command(['cp', 'api1.sh', 'app1.sh'])
            await run_shell_command(['sed', '-i', f's/€tor/{phone_number}/g', 'app1.sh'])
            result = await run_shell_command(['bash', 'app1.sh'])
            os.remove('app1.sh')
            await message.channel.send(f"api1.sh executed successfully on {phone_number}\n{result}")
        except Exception as e:
            await message.channel.send(f"Error executing api1.sh: {str(e)}")
    
    elif message.content.startswith(f'{COMMAND_PREFIX}help'):
        await message.channel.send(f"Commands:\n!bomb <number> - Bomb a phone number (admin only)\n")

# Run the bot
client.run(BOT_TOKEN)
